(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v1 ?v6)
             (pred_8 ?v2 ?v5)
             (pred_7 ?v1 ?v5)
             (pred_12 ?v9 ?v1 )
	     (pred_10 ?v1)
             (pred_9 ?v8)
             (pred_2 ?v2)
             (pred_3 ?v5)
             (pred_1 ?v1)
             (pred_6 ?v2)
             (pred_5 ?v1)
             (pred_4 ))



(:action op_1
:parameters (?v4 ?v11 ?v3 ?v12)
:precondition (and (pred_9 ?v4) (pred_9 ?v11) (pred_2 ?v3) (pred_3 ?v12)
          (pred_11 ?v4 ?v11) (pred_8 ?v3 ?v12)
                   (pred_7 ?v11 ?v12) (pred_10 ?v4) 
                   (pred_1 ?v11) (pred_6 ?v3))
:effect (and  (pred_5 ?v11) (not (pred_1 ?v11))))


(:action op_3
:parameters (?v4 ?v7)
:precondition (and (pred_9 ?v4) (pred_9 ?v7)
               (pred_10 ?v4) (pred_11 ?v4 ?v7) (pred_5 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_9 ?v4) (pred_2 ?v3) 
                  (pred_10 ?v4) (pred_12 ?v3 ?v4) (pred_4 ))
:effect (and (pred_6 ?v3)
   (not (pred_12 ?v3 ?v4)) (not (pred_4 ))))


(:action op_2
:parameters (?v4 ?v13 ?v10)
:precondition (and (pred_9 ?v4) (pred_2 ?v13) (pred_2 ?v10)
                  (pred_10 ?v4) (pred_6 ?v10) (pred_12 ?v13 ?v4))
:effect (and (pred_6 ?v13) (pred_12 ?v10 ?v4)
        (not (pred_6 ?v10)) (not (pred_12 ?v13 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_9 ?v4) (pred_2 ?v3) 
                  (pred_10 ?v4) (pred_6 ?v3))
:effect (and (pred_4 ) (pred_12 ?v3 ?v4) (not (pred_6 ?v3)))))


	
