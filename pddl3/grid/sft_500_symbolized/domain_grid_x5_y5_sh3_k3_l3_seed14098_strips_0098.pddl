(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v6)
             (pred_1 ?v3 ?v13)
             (pred_6 ?v5 ?v13)
             (pred_3 ?v2 ?v5 )
	     (pred_4 ?v5)
             (pred_5 ?v1)
             (pred_12 ?v3)
             (pred_10 ?v13)
             (pred_2 ?v5)
             (pred_9 ?v3)
             (pred_11 ?v5)
             (pred_8 ))



(:action op_5
:parameters (?v10 ?v11 ?v4 ?v9)
:precondition (and (pred_5 ?v10) (pred_5 ?v11) (pred_12 ?v4) (pred_10 ?v9)
          (pred_7 ?v10 ?v11) (pred_1 ?v4 ?v9)
                   (pred_6 ?v11 ?v9) (pred_4 ?v10) 
                   (pred_2 ?v11) (pred_9 ?v4))
:effect (and  (pred_11 ?v11) (not (pred_2 ?v11))))


(:action op_3
:parameters (?v10 ?v7)
:precondition (and (pred_5 ?v10) (pred_5 ?v7)
               (pred_4 ?v10) (pred_7 ?v10 ?v7) (pred_11 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v10))))

(:action op_4
:parameters (?v10 ?v4)
:precondition (and (pred_5 ?v10) (pred_12 ?v4) 
                  (pred_4 ?v10) (pred_3 ?v4 ?v10) (pred_8 ))
:effect (and (pred_9 ?v4)
   (not (pred_3 ?v4 ?v10)) (not (pred_8 ))))


(:action op_1
:parameters (?v10 ?v8 ?v12)
:precondition (and (pred_5 ?v10) (pred_12 ?v8) (pred_12 ?v12)
                  (pred_4 ?v10) (pred_9 ?v12) (pred_3 ?v8 ?v10))
:effect (and (pred_9 ?v8) (pred_3 ?v12 ?v10)
        (not (pred_9 ?v12)) (not (pred_3 ?v8 ?v10))))

(:action op_2
:parameters (?v10 ?v4)
:precondition (and (pred_5 ?v10) (pred_12 ?v4) 
                  (pred_4 ?v10) (pred_9 ?v4))
:effect (and (pred_8 ) (pred_3 ?v4 ?v10) (not (pred_9 ?v4)))))


	
