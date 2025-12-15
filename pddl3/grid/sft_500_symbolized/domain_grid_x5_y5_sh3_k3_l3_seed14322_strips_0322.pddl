(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v1 ?v6)
             (pred_4 ?v8 ?v9)
             (pred_3 ?v1 ?v9)
             (pred_6 ?v5 ?v1 )
	     (pred_8 ?v1)
             (pred_1 ?v10)
             (pred_2 ?v8)
             (pred_7 ?v9)
             (pred_9 ?v1)
             (pred_11 ?v8)
             (pred_12 ?v1)
             (pred_5 ))



(:action op_4
:parameters (?v12 ?v7 ?v2 ?v4)
:precondition (and (pred_1 ?v12) (pred_1 ?v7) (pred_2 ?v2) (pred_7 ?v4)
          (pred_10 ?v12 ?v7) (pred_4 ?v2 ?v4)
                   (pred_3 ?v7 ?v4) (pred_8 ?v12) 
                   (pred_9 ?v7) (pred_11 ?v2))
:effect (and  (pred_12 ?v7) (not (pred_9 ?v7))))


(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v3)
               (pred_8 ?v12) (pred_10 ?v12 ?v3) (pred_12 ?v3))
:effect (and (pred_8 ?v3) (not (pred_8 ?v12))))

(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_1 ?v12) (pred_2 ?v2) 
                  (pred_8 ?v12) (pred_6 ?v2 ?v12) (pred_5 ))
:effect (and (pred_11 ?v2)
   (not (pred_6 ?v2 ?v12)) (not (pred_5 ))))


(:action op_3
:parameters (?v12 ?v11 ?v13)
:precondition (and (pred_1 ?v12) (pred_2 ?v11) (pred_2 ?v13)
                  (pred_8 ?v12) (pred_11 ?v13) (pred_6 ?v11 ?v12))
:effect (and (pred_11 ?v11) (pred_6 ?v13 ?v12)
        (not (pred_11 ?v13)) (not (pred_6 ?v11 ?v12))))

(:action op_5
:parameters (?v12 ?v2)
:precondition (and (pred_1 ?v12) (pred_2 ?v2) 
                  (pred_8 ?v12) (pred_11 ?v2))
:effect (and (pred_5 ) (pred_6 ?v2 ?v12) (not (pred_11 ?v2)))))


	
