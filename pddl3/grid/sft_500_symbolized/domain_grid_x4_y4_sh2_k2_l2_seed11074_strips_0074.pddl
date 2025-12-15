(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v5)
             (pred_10 ?v8 ?v1)
             (pred_6 ?v4 ?v1)
             (pred_7 ?v6 ?v4 )
	     (pred_12 ?v4)
             (pred_5 ?v11)
             (pred_4 ?v8)
             (pred_3 ?v1)
             (pred_9 ?v4)
             (pred_11 ?v8)
             (pred_8 ?v4)
             (pred_2 ))



(:action op_5
:parameters (?v7 ?v10 ?v3 ?v12)
:precondition (and (pred_5 ?v7) (pred_5 ?v10) (pred_4 ?v3) (pred_3 ?v12)
          (pred_1 ?v7 ?v10) (pred_10 ?v3 ?v12)
                   (pred_6 ?v10 ?v12) (pred_12 ?v7) 
                   (pred_9 ?v10) (pred_11 ?v3))
:effect (and  (pred_8 ?v10) (not (pred_9 ?v10))))


(:action op_4
:parameters (?v7 ?v13)
:precondition (and (pred_5 ?v7) (pred_5 ?v13)
               (pred_12 ?v7) (pred_1 ?v7 ?v13) (pred_8 ?v13))
:effect (and (pred_12 ?v13) (not (pred_12 ?v7))))

(:action op_1
:parameters (?v7 ?v3)
:precondition (and (pred_5 ?v7) (pred_4 ?v3) 
                  (pred_12 ?v7) (pred_7 ?v3 ?v7) (pred_2 ))
:effect (and (pred_11 ?v3)
   (not (pred_7 ?v3 ?v7)) (not (pred_2 ))))


(:action op_3
:parameters (?v7 ?v2 ?v9)
:precondition (and (pred_5 ?v7) (pred_4 ?v2) (pred_4 ?v9)
                  (pred_12 ?v7) (pred_11 ?v9) (pred_7 ?v2 ?v7))
:effect (and (pred_11 ?v2) (pred_7 ?v9 ?v7)
        (not (pred_11 ?v9)) (not (pred_7 ?v2 ?v7))))

(:action op_2
:parameters (?v7 ?v3)
:precondition (and (pred_5 ?v7) (pred_4 ?v3) 
                  (pred_12 ?v7) (pred_11 ?v3))
:effect (and (pred_2 ) (pred_7 ?v3 ?v7) (not (pred_11 ?v3)))))


	
