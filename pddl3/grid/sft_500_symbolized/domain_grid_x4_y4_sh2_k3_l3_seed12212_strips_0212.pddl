(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v8)
             (pred_6 ?v6 ?v9)
             (pred_2 ?v13 ?v9)
             (pred_4 ?v10 ?v13 )
	     (pred_8 ?v13)
             (pred_5 ?v4)
             (pred_9 ?v6)
             (pred_12 ?v9)
             (pred_7 ?v13)
             (pred_3 ?v6)
             (pred_11 ?v13)
             (pred_1 ))



(:action op_1
:parameters (?v12 ?v5 ?v3 ?v11)
:precondition (and (pred_5 ?v12) (pred_5 ?v5) (pred_9 ?v3) (pred_12 ?v11)
          (pred_10 ?v12 ?v5) (pred_6 ?v3 ?v11)
                   (pred_2 ?v5 ?v11) (pred_8 ?v12) 
                   (pred_7 ?v5) (pred_3 ?v3))
:effect (and  (pred_11 ?v5) (not (pred_7 ?v5))))


(:action op_5
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_5 ?v7)
               (pred_8 ?v12) (pred_10 ?v12 ?v7) (pred_11 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v12))))

(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_5 ?v12) (pred_9 ?v3) 
                  (pred_8 ?v12) (pred_4 ?v3 ?v12) (pred_1 ))
:effect (and (pred_3 ?v3)
   (not (pred_4 ?v3 ?v12)) (not (pred_1 ))))


(:action op_2
:parameters (?v12 ?v2 ?v1)
:precondition (and (pred_5 ?v12) (pred_9 ?v2) (pred_9 ?v1)
                  (pred_8 ?v12) (pred_3 ?v1) (pred_4 ?v2 ?v12))
:effect (and (pred_3 ?v2) (pred_4 ?v1 ?v12)
        (not (pred_3 ?v1)) (not (pred_4 ?v2 ?v12))))

(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_5 ?v12) (pred_9 ?v3) 
                  (pred_8 ?v12) (pred_3 ?v3))
:effect (and (pred_1 ) (pred_4 ?v3 ?v12) (not (pred_3 ?v3)))))


	
