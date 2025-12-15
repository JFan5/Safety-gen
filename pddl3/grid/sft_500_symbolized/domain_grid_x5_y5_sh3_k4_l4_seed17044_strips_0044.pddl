(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v4)
             (pred_1 ?v11 ?v3)
             (pred_3 ?v12 ?v3)
             (pred_2 ?v2 ?v12 )
	     (pred_5 ?v12)
             (pred_6 ?v7)
             (pred_4 ?v11)
             (pred_11 ?v3)
             (pred_12 ?v12)
             (pred_7 ?v11)
             (pred_9 ?v12)
             (pred_10 ))



(:action op_1
:parameters (?v9 ?v5 ?v6 ?v1)
:precondition (and (pred_6 ?v9) (pred_6 ?v5) (pred_4 ?v6) (pred_11 ?v1)
          (pred_8 ?v9 ?v5) (pred_1 ?v6 ?v1)
                   (pred_3 ?v5 ?v1) (pred_5 ?v9) 
                   (pred_12 ?v5) (pred_7 ?v6))
:effect (and  (pred_9 ?v5) (not (pred_12 ?v5))))


(:action op_5
:parameters (?v9 ?v10)
:precondition (and (pred_6 ?v9) (pred_6 ?v10)
               (pred_5 ?v9) (pred_8 ?v9 ?v10) (pred_9 ?v10))
:effect (and (pred_5 ?v10) (not (pred_5 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_4 ?v6) 
                  (pred_5 ?v9) (pred_2 ?v6 ?v9) (pred_10 ))
:effect (and (pred_7 ?v6)
   (not (pred_2 ?v6 ?v9)) (not (pred_10 ))))


(:action op_2
:parameters (?v9 ?v13 ?v8)
:precondition (and (pred_6 ?v9) (pred_4 ?v13) (pred_4 ?v8)
                  (pred_5 ?v9) (pred_7 ?v8) (pred_2 ?v13 ?v9))
:effect (and (pred_7 ?v13) (pred_2 ?v8 ?v9)
        (not (pred_7 ?v8)) (not (pred_2 ?v13 ?v9))))

(:action op_3
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_4 ?v6) 
                  (pred_5 ?v9) (pred_7 ?v6))
:effect (and (pred_10 ) (pred_2 ?v6 ?v9) (not (pred_7 ?v6)))))


	
