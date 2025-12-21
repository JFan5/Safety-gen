(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v6)
             (pred_4 ?v3 ?v8)
             (pred_7 ?v2 ?v8)
             (pred_11 ?v5 ?v2 )
	     (pred_9 ?v2)
             (pred_1 ?v1)
             (pred_10 ?v3)
             (pred_12 ?v8)
             (pred_2 ?v2)
             (pred_8 ?v3)
             (pred_6 ?v2)
             (pred_5 ))



(:action op_1
:parameters (?v12 ?v10 ?v9 ?v7)
:precondition (and (pred_1 ?v12) (pred_1 ?v10) (pred_10 ?v9) (pred_12 ?v7)
          (pred_3 ?v12 ?v10) (pred_4 ?v9 ?v7)
                   (pred_7 ?v10 ?v7) (pred_9 ?v12) 
                   (pred_2 ?v10) (pred_8 ?v9))
:effect (and  (pred_6 ?v10) (not (pred_2 ?v10))))


(:action op_3
:parameters (?v12 ?v4)
:precondition (and (pred_1 ?v12) (pred_1 ?v4)
               (pred_9 ?v12) (pred_3 ?v12 ?v4) (pred_6 ?v4))
:effect (and (pred_9 ?v4) (not (pred_9 ?v12))))

(:action op_4
:parameters (?v12 ?v9)
:precondition (and (pred_1 ?v12) (pred_10 ?v9) 
                  (pred_9 ?v12) (pred_11 ?v9 ?v12) (pred_5 ))
:effect (and (pred_8 ?v9)
   (not (pred_11 ?v9 ?v12)) (not (pred_5 ))))


(:action op_2
:parameters (?v12 ?v13 ?v11)
:precondition (and (pred_1 ?v12) (pred_10 ?v13) (pred_10 ?v11)
                  (pred_9 ?v12) (pred_8 ?v11) (pred_11 ?v13 ?v12))
:effect (and (pred_8 ?v13) (pred_11 ?v11 ?v12)
        (not (pred_8 ?v11)) (not (pred_11 ?v13 ?v12))))

(:action op_5
:parameters (?v12 ?v9)
:precondition (and (pred_1 ?v12) (pred_10 ?v9) 
                  (pred_9 ?v12) (pred_8 ?v9))
:effect (and (pred_5 ) (pred_11 ?v9 ?v12) (not (pred_8 ?v9)))))


	
