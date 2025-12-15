(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v8)
             (pred_4 ?v3 ?v6)
             (pred_10 ?v10 ?v6)
             (pred_5 ?v9 ?v10 )
	     (pred_8 ?v10)
             (pred_1 ?v5)
             (pred_6 ?v3)
             (pred_9 ?v6)
             (pred_2 ?v10)
             (pred_11 ?v3)
             (pred_3 ?v10)
             (pred_7 ))



(:action op_2
:parameters (?v1 ?v11 ?v2 ?v12)
:precondition (and (pred_1 ?v1) (pred_1 ?v11) (pred_6 ?v2) (pred_9 ?v12)
          (pred_12 ?v1 ?v11) (pred_4 ?v2 ?v12)
                   (pred_10 ?v11 ?v12) (pred_8 ?v1) 
                   (pred_2 ?v11) (pred_11 ?v2))
:effect (and  (pred_3 ?v11) (not (pred_2 ?v11))))


(:action op_5
:parameters (?v1 ?v4)
:precondition (and (pred_1 ?v1) (pred_1 ?v4)
               (pred_8 ?v1) (pred_12 ?v1 ?v4) (pred_3 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v1))))

(:action op_1
:parameters (?v1 ?v2)
:precondition (and (pred_1 ?v1) (pred_6 ?v2) 
                  (pred_8 ?v1) (pred_5 ?v2 ?v1) (pred_7 ))
:effect (and (pred_11 ?v2)
   (not (pred_5 ?v2 ?v1)) (not (pred_7 ))))


(:action op_4
:parameters (?v1 ?v7 ?v13)
:precondition (and (pred_1 ?v1) (pred_6 ?v7) (pred_6 ?v13)
                  (pred_8 ?v1) (pred_11 ?v13) (pred_5 ?v7 ?v1))
:effect (and (pred_11 ?v7) (pred_5 ?v13 ?v1)
        (not (pred_11 ?v13)) (not (pred_5 ?v7 ?v1))))

(:action op_3
:parameters (?v1 ?v2)
:precondition (and (pred_1 ?v1) (pred_6 ?v2) 
                  (pred_8 ?v1) (pred_11 ?v2))
:effect (and (pred_7 ) (pred_5 ?v2 ?v1) (not (pred_11 ?v2)))))


	
