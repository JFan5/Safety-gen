(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v13 ?v1)
             (pred_6 ?v6 ?v9)
             (pred_10 ?v13 ?v9)
             (pred_3 ?v12 ?v13 )
	     (pred_9 ?v13)
             (pred_2 ?v8)
             (pred_4 ?v6)
             (pred_8 ?v9)
             (pred_11 ?v13)
             (pred_12 ?v6)
             (pred_1 ?v13)
             (pred_7 ))



(:action op_5
:parameters (?v10 ?v11 ?v3 ?v7)
:precondition (and (pred_2 ?v10) (pred_2 ?v11) (pred_4 ?v3) (pred_8 ?v7)
          (pred_5 ?v10 ?v11) (pred_6 ?v3 ?v7)
                   (pred_10 ?v11 ?v7) (pred_9 ?v10) 
                   (pred_11 ?v11) (pred_12 ?v3))
:effect (and  (pred_1 ?v11) (not (pred_11 ?v11))))


(:action op_2
:parameters (?v10 ?v2)
:precondition (and (pred_2 ?v10) (pred_2 ?v2)
               (pred_9 ?v10) (pred_5 ?v10 ?v2) (pred_1 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v10))))

(:action op_4
:parameters (?v10 ?v3)
:precondition (and (pred_2 ?v10) (pred_4 ?v3) 
                  (pred_9 ?v10) (pred_3 ?v3 ?v10) (pred_7 ))
:effect (and (pred_12 ?v3)
   (not (pred_3 ?v3 ?v10)) (not (pred_7 ))))


(:action op_1
:parameters (?v10 ?v5 ?v4)
:precondition (and (pred_2 ?v10) (pred_4 ?v5) (pred_4 ?v4)
                  (pred_9 ?v10) (pred_12 ?v4) (pred_3 ?v5 ?v10))
:effect (and (pred_12 ?v5) (pred_3 ?v4 ?v10)
        (not (pred_12 ?v4)) (not (pred_3 ?v5 ?v10))))

(:action op_3
:parameters (?v10 ?v3)
:precondition (and (pred_2 ?v10) (pred_4 ?v3) 
                  (pred_9 ?v10) (pred_12 ?v3))
:effect (and (pred_7 ) (pred_3 ?v3 ?v10) (not (pred_12 ?v3)))))


	
