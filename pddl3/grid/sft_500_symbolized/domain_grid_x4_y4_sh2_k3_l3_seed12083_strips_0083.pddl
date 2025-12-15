(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v13)
             (pred_1 ?v8 ?v1)
             (pred_6 ?v2 ?v1)
             (pred_9 ?v12 ?v2 )
	     (pred_11 ?v2)
             (pred_12 ?v10)
             (pred_4 ?v8)
             (pred_8 ?v1)
             (pred_7 ?v2)
             (pred_2 ?v8)
             (pred_3 ?v2)
             (pred_10 ))



(:action op_3
:parameters (?v9 ?v11 ?v6 ?v7)
:precondition (and (pred_12 ?v9) (pred_12 ?v11) (pred_4 ?v6) (pred_8 ?v7)
          (pred_5 ?v9 ?v11) (pred_1 ?v6 ?v7)
                   (pred_6 ?v11 ?v7) (pred_11 ?v9) 
                   (pred_7 ?v11) (pred_2 ?v6))
:effect (and  (pred_3 ?v11) (not (pred_7 ?v11))))


(:action op_1
:parameters (?v9 ?v4)
:precondition (and (pred_12 ?v9) (pred_12 ?v4)
               (pred_11 ?v9) (pred_5 ?v9 ?v4) (pred_3 ?v4))
:effect (and (pred_11 ?v4) (not (pred_11 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_12 ?v9) (pred_4 ?v6) 
                  (pred_11 ?v9) (pred_9 ?v6 ?v9) (pred_10 ))
:effect (and (pred_2 ?v6)
   (not (pred_9 ?v6 ?v9)) (not (pred_10 ))))


(:action op_5
:parameters (?v9 ?v3 ?v5)
:precondition (and (pred_12 ?v9) (pred_4 ?v3) (pred_4 ?v5)
                  (pred_11 ?v9) (pred_2 ?v5) (pred_9 ?v3 ?v9))
:effect (and (pred_2 ?v3) (pred_9 ?v5 ?v9)
        (not (pred_2 ?v5)) (not (pred_9 ?v3 ?v9))))

(:action op_2
:parameters (?v9 ?v6)
:precondition (and (pred_12 ?v9) (pred_4 ?v6) 
                  (pred_11 ?v9) (pred_2 ?v6))
:effect (and (pred_10 ) (pred_9 ?v6 ?v9) (not (pred_2 ?v6)))))


	
