(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v8)
             (pred_4 ?v11 ?v13)
             (pred_9 ?v7 ?v13)
             (pred_6 ?v5 ?v7 )
	     (pred_5 ?v7)
             (pred_8 ?v4)
             (pred_1 ?v11)
             (pred_12 ?v13)
             (pred_11 ?v7)
             (pred_10 ?v11)
             (pred_3 ?v7)
             (pred_2 ))



(:action op_2
:parameters (?v9 ?v6 ?v2 ?v10)
:precondition (and (pred_8 ?v9) (pred_8 ?v6) (pred_1 ?v2) (pred_12 ?v10)
          (pred_7 ?v9 ?v6) (pred_4 ?v2 ?v10)
                   (pred_9 ?v6 ?v10) (pred_5 ?v9) 
                   (pred_11 ?v6) (pred_10 ?v2))
:effect (and  (pred_3 ?v6) (not (pred_11 ?v6))))


(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_8 ?v9) (pred_8 ?v1)
               (pred_5 ?v9) (pred_7 ?v9 ?v1) (pred_3 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v9))))

(:action op_4
:parameters (?v9 ?v2)
:precondition (and (pred_8 ?v9) (pred_1 ?v2) 
                  (pred_5 ?v9) (pred_6 ?v2 ?v9) (pred_2 ))
:effect (and (pred_10 ?v2)
   (not (pred_6 ?v2 ?v9)) (not (pred_2 ))))


(:action op_5
:parameters (?v9 ?v12 ?v3)
:precondition (and (pred_8 ?v9) (pred_1 ?v12) (pred_1 ?v3)
                  (pred_5 ?v9) (pred_10 ?v3) (pred_6 ?v12 ?v9))
:effect (and (pred_10 ?v12) (pred_6 ?v3 ?v9)
        (not (pred_10 ?v3)) (not (pred_6 ?v12 ?v9))))

(:action op_3
:parameters (?v9 ?v2)
:precondition (and (pred_8 ?v9) (pred_1 ?v2) 
                  (pred_5 ?v9) (pred_10 ?v2))
:effect (and (pred_2 ) (pred_6 ?v2 ?v9) (not (pred_10 ?v2)))))


	
