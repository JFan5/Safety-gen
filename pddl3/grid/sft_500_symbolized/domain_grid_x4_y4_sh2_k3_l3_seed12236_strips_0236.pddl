(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v13 ?v8)
             (pred_1 ?v1 ?v4)
             (pred_3 ?v13 ?v4)
             (pred_2 ?v10 ?v13 )
	     (pred_4 ?v13)
             (pred_6 ?v6)
             (pred_10 ?v1)
             (pred_12 ?v4)
             (pred_9 ?v13)
             (pred_8 ?v1)
             (pred_11 ?v13)
             (pred_7 ))



(:action op_1
:parameters (?v12 ?v7 ?v2 ?v11)
:precondition (and (pred_6 ?v12) (pred_6 ?v7) (pred_10 ?v2) (pred_12 ?v11)
          (pred_5 ?v12 ?v7) (pred_1 ?v2 ?v11)
                   (pred_3 ?v7 ?v11) (pred_4 ?v12) 
                   (pred_9 ?v7) (pred_8 ?v2))
:effect (and  (pred_11 ?v7) (not (pred_9 ?v7))))


(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_6 ?v12) (pred_6 ?v3)
               (pred_4 ?v12) (pred_5 ?v12 ?v3) (pred_11 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v12))))

(:action op_3
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_10 ?v2) 
                  (pred_4 ?v12) (pred_2 ?v2 ?v12) (pred_7 ))
:effect (and (pred_8 ?v2)
   (not (pred_2 ?v2 ?v12)) (not (pred_7 ))))


(:action op_4
:parameters (?v12 ?v5 ?v9)
:precondition (and (pred_6 ?v12) (pred_10 ?v5) (pred_10 ?v9)
                  (pred_4 ?v12) (pred_8 ?v9) (pred_2 ?v5 ?v12))
:effect (and (pred_8 ?v5) (pred_2 ?v9 ?v12)
        (not (pred_8 ?v9)) (not (pred_2 ?v5 ?v12))))

(:action op_5
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_10 ?v2) 
                  (pred_4 ?v12) (pred_8 ?v2))
:effect (and (pred_7 ) (pred_2 ?v2 ?v12) (not (pred_8 ?v2)))))


	
