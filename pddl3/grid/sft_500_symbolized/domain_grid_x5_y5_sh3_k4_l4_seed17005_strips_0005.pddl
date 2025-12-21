(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v7)
             (pred_1 ?v6 ?v5)
             (pred_12 ?v3 ?v5)
             (pred_6 ?v13 ?v3 )
	     (pred_10 ?v3)
             (pred_8 ?v8)
             (pred_5 ?v6)
             (pred_2 ?v5)
             (pred_4 ?v3)
             (pred_7 ?v6)
             (pred_11 ?v3)
             (pred_3 ))



(:action op_2
:parameters (?v2 ?v11 ?v4 ?v1)
:precondition (and (pred_8 ?v2) (pred_8 ?v11) (pred_5 ?v4) (pred_2 ?v1)
          (pred_9 ?v2 ?v11) (pred_1 ?v4 ?v1)
                   (pred_12 ?v11 ?v1) (pred_10 ?v2) 
                   (pred_4 ?v11) (pred_7 ?v4))
:effect (and  (pred_11 ?v11) (not (pred_4 ?v11))))


(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_8 ?v2) (pred_8 ?v9)
               (pred_10 ?v2) (pred_9 ?v2 ?v9) (pred_11 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v2))))

(:action op_3
:parameters (?v2 ?v4)
:precondition (and (pred_8 ?v2) (pred_5 ?v4) 
                  (pred_10 ?v2) (pred_6 ?v4 ?v2) (pred_3 ))
:effect (and (pred_7 ?v4)
   (not (pred_6 ?v4 ?v2)) (not (pred_3 ))))


(:action op_4
:parameters (?v2 ?v12 ?v10)
:precondition (and (pred_8 ?v2) (pred_5 ?v12) (pred_5 ?v10)
                  (pred_10 ?v2) (pred_7 ?v10) (pred_6 ?v12 ?v2))
:effect (and (pred_7 ?v12) (pred_6 ?v10 ?v2)
        (not (pred_7 ?v10)) (not (pred_6 ?v12 ?v2))))

(:action op_1
:parameters (?v2 ?v4)
:precondition (and (pred_8 ?v2) (pred_5 ?v4) 
                  (pred_10 ?v2) (pred_7 ?v4))
:effect (and (pred_3 ) (pred_6 ?v4 ?v2) (not (pred_7 ?v4)))))


	
