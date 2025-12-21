(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v10)
             (pred_8 ?v12 ?v6)
             (pred_10 ?v2 ?v6)
             (pred_1 ?v13 ?v2 )
	     (pred_4 ?v2)
             (pred_6 ?v5)
             (pred_12 ?v12)
             (pred_3 ?v6)
             (pred_9 ?v2)
             (pred_7 ?v12)
             (pred_5 ?v2)
             (pred_2 ))



(:action op_1
:parameters (?v4 ?v11 ?v9 ?v7)
:precondition (and (pred_6 ?v4) (pred_6 ?v11) (pred_12 ?v9) (pred_3 ?v7)
          (pred_11 ?v4 ?v11) (pred_8 ?v9 ?v7)
                   (pred_10 ?v11 ?v7) (pred_4 ?v4) 
                   (pred_9 ?v11) (pred_7 ?v9))
:effect (and  (pred_5 ?v11) (not (pred_9 ?v11))))


(:action op_3
:parameters (?v4 ?v3)
:precondition (and (pred_6 ?v4) (pred_6 ?v3)
               (pred_4 ?v4) (pred_11 ?v4 ?v3) (pred_5 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v4))))

(:action op_4
:parameters (?v4 ?v9)
:precondition (and (pred_6 ?v4) (pred_12 ?v9) 
                  (pred_4 ?v4) (pred_1 ?v9 ?v4) (pred_2 ))
:effect (and (pred_7 ?v9)
   (not (pred_1 ?v9 ?v4)) (not (pred_2 ))))


(:action op_5
:parameters (?v4 ?v8 ?v1)
:precondition (and (pred_6 ?v4) (pred_12 ?v8) (pred_12 ?v1)
                  (pred_4 ?v4) (pred_7 ?v1) (pred_1 ?v8 ?v4))
:effect (and (pred_7 ?v8) (pred_1 ?v1 ?v4)
        (not (pred_7 ?v1)) (not (pred_1 ?v8 ?v4))))

(:action op_2
:parameters (?v4 ?v9)
:precondition (and (pred_6 ?v4) (pred_12 ?v9) 
                  (pred_4 ?v4) (pred_7 ?v9))
:effect (and (pred_2 ) (pred_1 ?v9 ?v4) (not (pred_7 ?v9)))))


	
