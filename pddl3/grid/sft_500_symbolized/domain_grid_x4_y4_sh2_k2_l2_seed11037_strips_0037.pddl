(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v13)
             (pred_1 ?v3 ?v4)
             (pred_10 ?v2 ?v4)
             (pred_9 ?v7 ?v2 )
	     (pred_2 ?v2)
             (pred_6 ?v12)
             (pred_7 ?v3)
             (pred_5 ?v4)
             (pred_11 ?v2)
             (pred_4 ?v3)
             (pred_8 ?v2)
             (pred_12 ))



(:action op_3
:parameters (?v9 ?v11 ?v6 ?v10)
:precondition (and (pred_6 ?v9) (pred_6 ?v11) (pred_7 ?v6) (pred_5 ?v10)
          (pred_3 ?v9 ?v11) (pred_1 ?v6 ?v10)
                   (pred_10 ?v11 ?v10) (pred_2 ?v9) 
                   (pred_11 ?v11) (pred_4 ?v6))
:effect (and  (pred_8 ?v11) (not (pred_11 ?v11))))


(:action op_5
:parameters (?v9 ?v5)
:precondition (and (pred_6 ?v9) (pred_6 ?v5)
               (pred_2 ?v9) (pred_3 ?v9 ?v5) (pred_8 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v9))))

(:action op_1
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_7 ?v6) 
                  (pred_2 ?v9) (pred_9 ?v6 ?v9) (pred_12 ))
:effect (and (pred_4 ?v6)
   (not (pred_9 ?v6 ?v9)) (not (pred_12 ))))


(:action op_4
:parameters (?v9 ?v1 ?v8)
:precondition (and (pred_6 ?v9) (pred_7 ?v1) (pred_7 ?v8)
                  (pred_2 ?v9) (pred_4 ?v8) (pred_9 ?v1 ?v9))
:effect (and (pred_4 ?v1) (pred_9 ?v8 ?v9)
        (not (pred_4 ?v8)) (not (pred_9 ?v1 ?v9))))

(:action op_2
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_7 ?v6) 
                  (pred_2 ?v9) (pred_4 ?v6))
:effect (and (pred_12 ) (pred_9 ?v6 ?v9) (not (pred_4 ?v6)))))


	
