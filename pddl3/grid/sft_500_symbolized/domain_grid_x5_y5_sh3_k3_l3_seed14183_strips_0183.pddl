(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v5)
             (pred_6 ?v10 ?v3)
             (pred_3 ?v9 ?v3)
             (pred_8 ?v2 ?v9 )
	     (pred_1 ?v9)
             (pred_7 ?v8)
             (pred_9 ?v10)
             (pred_4 ?v3)
             (pred_10 ?v9)
             (pred_5 ?v10)
             (pred_2 ?v9)
             (pred_12 ))



(:action op_1
:parameters (?v4 ?v13 ?v7 ?v6)
:precondition (and (pred_7 ?v4) (pred_7 ?v13) (pred_9 ?v7) (pred_4 ?v6)
          (pred_11 ?v4 ?v13) (pred_6 ?v7 ?v6)
                   (pred_3 ?v13 ?v6) (pred_1 ?v4) 
                   (pred_10 ?v13) (pred_5 ?v7))
:effect (and  (pred_2 ?v13) (not (pred_10 ?v13))))


(:action op_4
:parameters (?v4 ?v1)
:precondition (and (pred_7 ?v4) (pred_7 ?v1)
               (pred_1 ?v4) (pred_11 ?v4 ?v1) (pred_2 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v4))))

(:action op_3
:parameters (?v4 ?v7)
:precondition (and (pred_7 ?v4) (pred_9 ?v7) 
                  (pred_1 ?v4) (pred_8 ?v7 ?v4) (pred_12 ))
:effect (and (pred_5 ?v7)
   (not (pred_8 ?v7 ?v4)) (not (pred_12 ))))


(:action op_2
:parameters (?v4 ?v11 ?v12)
:precondition (and (pred_7 ?v4) (pred_9 ?v11) (pred_9 ?v12)
                  (pred_1 ?v4) (pred_5 ?v12) (pred_8 ?v11 ?v4))
:effect (and (pred_5 ?v11) (pred_8 ?v12 ?v4)
        (not (pred_5 ?v12)) (not (pred_8 ?v11 ?v4))))

(:action op_5
:parameters (?v4 ?v7)
:precondition (and (pred_7 ?v4) (pred_9 ?v7) 
                  (pred_1 ?v4) (pred_5 ?v7))
:effect (and (pred_12 ) (pred_8 ?v7 ?v4) (not (pred_5 ?v7)))))


	
