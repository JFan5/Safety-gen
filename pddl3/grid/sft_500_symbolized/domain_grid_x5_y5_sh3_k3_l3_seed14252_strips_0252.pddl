(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v7)
             (pred_4 ?v13 ?v6)
             (pred_11 ?v8 ?v6)
             (pred_6 ?v9 ?v8 )
	     (pred_3 ?v8)
             (pred_9 ?v12)
             (pred_1 ?v13)
             (pred_10 ?v6)
             (pred_7 ?v8)
             (pred_12 ?v13)
             (pred_8 ?v8)
             (pred_5 ))



(:action op_3
:parameters (?v3 ?v11 ?v2 ?v5)
:precondition (and (pred_9 ?v3) (pred_9 ?v11) (pred_1 ?v2) (pred_10 ?v5)
          (pred_2 ?v3 ?v11) (pred_4 ?v2 ?v5)
                   (pred_11 ?v11 ?v5) (pred_3 ?v3) 
                   (pred_7 ?v11) (pred_12 ?v2))
:effect (and  (pred_8 ?v11) (not (pred_7 ?v11))))


(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_9 ?v3) (pred_9 ?v1)
               (pred_3 ?v3) (pred_2 ?v3 ?v1) (pred_8 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v3))))

(:action op_4
:parameters (?v3 ?v2)
:precondition (and (pred_9 ?v3) (pred_1 ?v2) 
                  (pred_3 ?v3) (pred_6 ?v2 ?v3) (pred_5 ))
:effect (and (pred_12 ?v2)
   (not (pred_6 ?v2 ?v3)) (not (pred_5 ))))


(:action op_1
:parameters (?v3 ?v4 ?v10)
:precondition (and (pred_9 ?v3) (pred_1 ?v4) (pred_1 ?v10)
                  (pred_3 ?v3) (pred_12 ?v10) (pred_6 ?v4 ?v3))
:effect (and (pred_12 ?v4) (pred_6 ?v10 ?v3)
        (not (pred_12 ?v10)) (not (pred_6 ?v4 ?v3))))

(:action op_5
:parameters (?v3 ?v2)
:precondition (and (pred_9 ?v3) (pred_1 ?v2) 
                  (pred_3 ?v3) (pred_12 ?v2))
:effect (and (pred_5 ) (pred_6 ?v2 ?v3) (not (pred_12 ?v2)))))


	
