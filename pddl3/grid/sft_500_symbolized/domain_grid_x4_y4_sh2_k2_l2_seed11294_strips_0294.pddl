(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v8)
             (pred_2 ?v4 ?v3)
             (pred_12 ?v13 ?v3)
             (pred_5 ?v12 ?v13 )
	     (pred_6 ?v13)
             (pred_10 ?v5)
             (pred_11 ?v4)
             (pred_1 ?v3)
             (pred_4 ?v13)
             (pred_8 ?v4)
             (pred_3 ?v13)
             (pred_9 ))



(:action op_4
:parameters (?v2 ?v11 ?v1 ?v7)
:precondition (and (pred_10 ?v2) (pred_10 ?v11) (pred_11 ?v1) (pred_1 ?v7)
          (pred_7 ?v2 ?v11) (pred_2 ?v1 ?v7)
                   (pred_12 ?v11 ?v7) (pred_6 ?v2) 
                   (pred_4 ?v11) (pred_8 ?v1))
:effect (and  (pred_3 ?v11) (not (pred_4 ?v11))))


(:action op_2
:parameters (?v2 ?v10)
:precondition (and (pred_10 ?v2) (pred_10 ?v10)
               (pred_6 ?v2) (pred_7 ?v2 ?v10) (pred_3 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v2))))

(:action op_5
:parameters (?v2 ?v1)
:precondition (and (pred_10 ?v2) (pred_11 ?v1) 
                  (pred_6 ?v2) (pred_5 ?v1 ?v2) (pred_9 ))
:effect (and (pred_8 ?v1)
   (not (pred_5 ?v1 ?v2)) (not (pred_9 ))))


(:action op_3
:parameters (?v2 ?v9 ?v6)
:precondition (and (pred_10 ?v2) (pred_11 ?v9) (pred_11 ?v6)
                  (pred_6 ?v2) (pred_8 ?v6) (pred_5 ?v9 ?v2))
:effect (and (pred_8 ?v9) (pred_5 ?v6 ?v2)
        (not (pred_8 ?v6)) (not (pred_5 ?v9 ?v2))))

(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_10 ?v2) (pred_11 ?v1) 
                  (pred_6 ?v2) (pred_8 ?v1))
:effect (and (pred_9 ) (pred_5 ?v1 ?v2) (not (pred_8 ?v1)))))


	
