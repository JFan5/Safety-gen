(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v9)
             (pred_7 ?v2 ?v5)
             (pred_2 ?v10 ?v5)
             (pred_1 ?v1 ?v10 )
	     (pred_10 ?v10)
             (pred_6 ?v13)
             (pred_12 ?v2)
             (pred_4 ?v5)
             (pred_8 ?v10)
             (pred_5 ?v2)
             (pred_11 ?v10)
             (pred_9 ))



(:action op_5
:parameters (?v12 ?v6 ?v11 ?v8)
:precondition (and (pred_6 ?v12) (pred_6 ?v6) (pred_12 ?v11) (pred_4 ?v8)
          (pred_3 ?v12 ?v6) (pred_7 ?v11 ?v8)
                   (pred_2 ?v6 ?v8) (pred_10 ?v12) 
                   (pred_8 ?v6) (pred_5 ?v11))
:effect (and  (pred_11 ?v6) (not (pred_8 ?v6))))


(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_6 ?v12) (pred_6 ?v3)
               (pred_10 ?v12) (pred_3 ?v12 ?v3) (pred_11 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v12))))

(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_6 ?v12) (pred_12 ?v11) 
                  (pred_10 ?v12) (pred_1 ?v11 ?v12) (pred_9 ))
:effect (and (pred_5 ?v11)
   (not (pred_1 ?v11 ?v12)) (not (pred_9 ))))


(:action op_1
:parameters (?v12 ?v4 ?v7)
:precondition (and (pred_6 ?v12) (pred_12 ?v4) (pred_12 ?v7)
                  (pred_10 ?v12) (pred_5 ?v7) (pred_1 ?v4 ?v12))
:effect (and (pred_5 ?v4) (pred_1 ?v7 ?v12)
        (not (pred_5 ?v7)) (not (pred_1 ?v4 ?v12))))

(:action op_4
:parameters (?v12 ?v11)
:precondition (and (pred_6 ?v12) (pred_12 ?v11) 
                  (pred_10 ?v12) (pred_5 ?v11))
:effect (and (pred_9 ) (pred_1 ?v11 ?v12) (not (pred_5 ?v11)))))


	
