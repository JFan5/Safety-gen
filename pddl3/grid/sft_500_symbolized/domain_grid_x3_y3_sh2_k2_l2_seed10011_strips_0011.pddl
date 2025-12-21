(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v5)
             (pred_6 ?v3 ?v11)
             (pred_11 ?v10 ?v11)
             (pred_12 ?v6 ?v10 )
	     (pred_8 ?v10)
             (pred_5 ?v12)
             (pred_10 ?v3)
             (pred_3 ?v11)
             (pred_2 ?v10)
             (pred_7 ?v3)
             (pred_4 ?v10)
             (pred_1 ))



(:action op_5
:parameters (?v2 ?v7 ?v9 ?v4)
:precondition (and (pred_5 ?v2) (pred_5 ?v7) (pred_10 ?v9) (pred_3 ?v4)
          (pred_9 ?v2 ?v7) (pred_6 ?v9 ?v4)
                   (pred_11 ?v7 ?v4) (pred_8 ?v2) 
                   (pred_2 ?v7) (pred_7 ?v9))
:effect (and  (pred_4 ?v7) (not (pred_2 ?v7))))


(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_5 ?v2) (pred_5 ?v1)
               (pred_8 ?v2) (pred_9 ?v2 ?v1) (pred_4 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v2))))

(:action op_4
:parameters (?v2 ?v9)
:precondition (and (pred_5 ?v2) (pred_10 ?v9) 
                  (pred_8 ?v2) (pred_12 ?v9 ?v2) (pred_1 ))
:effect (and (pred_7 ?v9)
   (not (pred_12 ?v9 ?v2)) (not (pred_1 ))))


(:action op_2
:parameters (?v2 ?v13 ?v8)
:precondition (and (pred_5 ?v2) (pred_10 ?v13) (pred_10 ?v8)
                  (pred_8 ?v2) (pred_7 ?v8) (pred_12 ?v13 ?v2))
:effect (and (pred_7 ?v13) (pred_12 ?v8 ?v2)
        (not (pred_7 ?v8)) (not (pred_12 ?v13 ?v2))))

(:action op_3
:parameters (?v2 ?v9)
:precondition (and (pred_5 ?v2) (pred_10 ?v9) 
                  (pred_8 ?v2) (pred_7 ?v9))
:effect (and (pred_1 ) (pred_12 ?v9 ?v2) (not (pred_7 ?v9)))))


	
