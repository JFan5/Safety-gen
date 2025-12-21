(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v9)
             (pred_4 ?v5 ?v1)
             (pred_2 ?v6 ?v1)
             (pred_3 ?v8 ?v6 )
	     (pred_6 ?v6)
             (pred_5 ?v4)
             (pred_10 ?v5)
             (pred_1 ?v1)
             (pred_7 ?v6)
             (pred_11 ?v5)
             (pred_9 ?v6)
             (pred_8 ))



(:action op_2
:parameters (?v7 ?v2 ?v12 ?v11)
:precondition (and (pred_5 ?v7) (pred_5 ?v2) (pred_10 ?v12) (pred_1 ?v11)
          (pred_12 ?v7 ?v2) (pred_4 ?v12 ?v11)
                   (pred_2 ?v2 ?v11) (pred_6 ?v7) 
                   (pred_7 ?v2) (pred_11 ?v12))
:effect (and  (pred_9 ?v2) (not (pred_7 ?v2))))


(:action op_5
:parameters (?v7 ?v13)
:precondition (and (pred_5 ?v7) (pred_5 ?v13)
               (pred_6 ?v7) (pred_12 ?v7 ?v13) (pred_9 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v7))))

(:action op_3
:parameters (?v7 ?v12)
:precondition (and (pred_5 ?v7) (pred_10 ?v12) 
                  (pred_6 ?v7) (pred_3 ?v12 ?v7) (pred_8 ))
:effect (and (pred_11 ?v12)
   (not (pred_3 ?v12 ?v7)) (not (pred_8 ))))


(:action op_4
:parameters (?v7 ?v10 ?v3)
:precondition (and (pred_5 ?v7) (pred_10 ?v10) (pred_10 ?v3)
                  (pred_6 ?v7) (pred_11 ?v3) (pred_3 ?v10 ?v7))
:effect (and (pred_11 ?v10) (pred_3 ?v3 ?v7)
        (not (pred_11 ?v3)) (not (pred_3 ?v10 ?v7))))

(:action op_1
:parameters (?v7 ?v12)
:precondition (and (pred_5 ?v7) (pred_10 ?v12) 
                  (pred_6 ?v7) (pred_11 ?v12))
:effect (and (pred_8 ) (pred_3 ?v12 ?v7) (not (pred_11 ?v12)))))


	
