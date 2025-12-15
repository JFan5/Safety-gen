(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v12)
             (pred_7 ?v8 ?v4)
             (pred_5 ?v1 ?v4)
             (pred_3 ?v3 ?v1 )
	     (pred_8 ?v1)
             (pred_4 ?v11)
             (pred_6 ?v8)
             (pred_11 ?v4)
             (pred_1 ?v1)
             (pred_10 ?v8)
             (pred_2 ?v1)
             (pred_9 ))



(:action op_2
:parameters (?v9 ?v7 ?v2 ?v13)
:precondition (and (pred_4 ?v9) (pred_4 ?v7) (pred_6 ?v2) (pred_11 ?v13)
          (pred_12 ?v9 ?v7) (pred_7 ?v2 ?v13)
                   (pred_5 ?v7 ?v13) (pred_8 ?v9) 
                   (pred_1 ?v7) (pred_10 ?v2))
:effect (and  (pred_2 ?v7) (not (pred_1 ?v7))))


(:action op_3
:parameters (?v9 ?v5)
:precondition (and (pred_4 ?v9) (pred_4 ?v5)
               (pred_8 ?v9) (pred_12 ?v9 ?v5) (pred_2 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v9))))

(:action op_4
:parameters (?v9 ?v2)
:precondition (and (pred_4 ?v9) (pred_6 ?v2) 
                  (pred_8 ?v9) (pred_3 ?v2 ?v9) (pred_9 ))
:effect (and (pred_10 ?v2)
   (not (pred_3 ?v2 ?v9)) (not (pred_9 ))))


(:action op_5
:parameters (?v9 ?v6 ?v10)
:precondition (and (pred_4 ?v9) (pred_6 ?v6) (pred_6 ?v10)
                  (pred_8 ?v9) (pred_10 ?v10) (pred_3 ?v6 ?v9))
:effect (and (pred_10 ?v6) (pred_3 ?v10 ?v9)
        (not (pred_10 ?v10)) (not (pred_3 ?v6 ?v9))))

(:action op_1
:parameters (?v9 ?v2)
:precondition (and (pred_4 ?v9) (pred_6 ?v2) 
                  (pred_8 ?v9) (pred_10 ?v2))
:effect (and (pred_9 ) (pred_3 ?v2 ?v9) (not (pred_10 ?v2)))))


	
