(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v11)
             (pred_2 ?v6 ?v2)
             (pred_9 ?v8 ?v2)
             (pred_1 ?v10 ?v8 )
	     (pred_5 ?v8)
             (pred_6 ?v5)
             (pred_12 ?v6)
             (pred_7 ?v2)
             (pred_3 ?v8)
             (pred_11 ?v6)
             (pred_4 ?v8)
             (pred_8 ))



(:action op_5
:parameters (?v12 ?v4 ?v9 ?v3)
:precondition (and (pred_6 ?v12) (pred_6 ?v4) (pred_12 ?v9) (pred_7 ?v3)
          (pred_10 ?v12 ?v4) (pred_2 ?v9 ?v3)
                   (pred_9 ?v4 ?v3) (pred_5 ?v12) 
                   (pred_3 ?v4) (pred_11 ?v9))
:effect (and  (pred_4 ?v4) (not (pred_3 ?v4))))


(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_6 ?v12) (pred_6 ?v7)
               (pred_5 ?v12) (pred_10 ?v12 ?v7) (pred_4 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v12))))

(:action op_2
:parameters (?v12 ?v9)
:precondition (and (pred_6 ?v12) (pred_12 ?v9) 
                  (pred_5 ?v12) (pred_1 ?v9 ?v12) (pred_8 ))
:effect (and (pred_11 ?v9)
   (not (pred_1 ?v9 ?v12)) (not (pred_8 ))))


(:action op_4
:parameters (?v12 ?v1 ?v13)
:precondition (and (pred_6 ?v12) (pred_12 ?v1) (pred_12 ?v13)
                  (pred_5 ?v12) (pred_11 ?v13) (pred_1 ?v1 ?v12))
:effect (and (pred_11 ?v1) (pred_1 ?v13 ?v12)
        (not (pred_11 ?v13)) (not (pred_1 ?v1 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_6 ?v12) (pred_12 ?v9) 
                  (pred_5 ?v12) (pred_11 ?v9))
:effect (and (pred_8 ) (pred_1 ?v9 ?v12) (not (pred_11 ?v9)))))


	
