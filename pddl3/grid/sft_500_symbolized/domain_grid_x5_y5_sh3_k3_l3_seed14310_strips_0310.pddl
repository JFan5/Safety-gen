(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v6)
             (pred_3 ?v5 ?v11)
             (pred_8 ?v12 ?v11)
             (pred_5 ?v8 ?v12 )
	     (pred_12 ?v12)
             (pred_1 ?v9)
             (pred_7 ?v5)
             (pred_4 ?v11)
             (pred_10 ?v12)
             (pred_2 ?v5)
             (pred_6 ?v12)
             (pred_11 ))



(:action op_5
:parameters (?v10 ?v7 ?v2 ?v4)
:precondition (and (pred_1 ?v10) (pred_1 ?v7) (pred_7 ?v2) (pred_4 ?v4)
          (pred_9 ?v10 ?v7) (pred_3 ?v2 ?v4)
                   (pred_8 ?v7 ?v4) (pred_12 ?v10) 
                   (pred_10 ?v7) (pred_2 ?v2))
:effect (and  (pred_6 ?v7) (not (pred_10 ?v7))))


(:action op_3
:parameters (?v10 ?v13)
:precondition (and (pred_1 ?v10) (pred_1 ?v13)
               (pred_12 ?v10) (pred_9 ?v10 ?v13) (pred_6 ?v13))
:effect (and (pred_12 ?v13) (not (pred_12 ?v10))))

(:action op_2
:parameters (?v10 ?v2)
:precondition (and (pred_1 ?v10) (pred_7 ?v2) 
                  (pred_12 ?v10) (pred_5 ?v2 ?v10) (pred_11 ))
:effect (and (pred_2 ?v2)
   (not (pred_5 ?v2 ?v10)) (not (pred_11 ))))


(:action op_4
:parameters (?v10 ?v1 ?v3)
:precondition (and (pred_1 ?v10) (pred_7 ?v1) (pred_7 ?v3)
                  (pred_12 ?v10) (pred_2 ?v3) (pred_5 ?v1 ?v10))
:effect (and (pred_2 ?v1) (pred_5 ?v3 ?v10)
        (not (pred_2 ?v3)) (not (pred_5 ?v1 ?v10))))

(:action op_1
:parameters (?v10 ?v2)
:precondition (and (pred_1 ?v10) (pred_7 ?v2) 
                  (pred_12 ?v10) (pred_2 ?v2))
:effect (and (pred_11 ) (pred_5 ?v2 ?v10) (not (pred_2 ?v2)))))


	
