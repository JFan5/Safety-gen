(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v10)
             (pred_11 ?v2 ?v3)
             (pred_2 ?v6 ?v3)
             (pred_4 ?v8 ?v6 )
	     (pred_7 ?v6)
             (pred_9 ?v9)
             (pred_5 ?v2)
             (pred_6 ?v3)
             (pred_8 ?v6)
             (pred_3 ?v2)
             (pred_12 ?v6)
             (pred_1 ))



(:action op_3
:parameters (?v12 ?v7 ?v5 ?v11)
:precondition (and (pred_9 ?v12) (pred_9 ?v7) (pred_5 ?v5) (pred_6 ?v11)
          (pred_10 ?v12 ?v7) (pred_11 ?v5 ?v11)
                   (pred_2 ?v7 ?v11) (pred_7 ?v12) 
                   (pred_8 ?v7) (pred_3 ?v5))
:effect (and  (pred_12 ?v7) (not (pred_8 ?v7))))


(:action op_4
:parameters (?v12 ?v4)
:precondition (and (pred_9 ?v12) (pred_9 ?v4)
               (pred_7 ?v12) (pred_10 ?v12 ?v4) (pred_12 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_9 ?v12) (pred_5 ?v5) 
                  (pred_7 ?v12) (pred_4 ?v5 ?v12) (pred_1 ))
:effect (and (pred_3 ?v5)
   (not (pred_4 ?v5 ?v12)) (not (pred_1 ))))


(:action op_2
:parameters (?v12 ?v13 ?v1)
:precondition (and (pred_9 ?v12) (pred_5 ?v13) (pred_5 ?v1)
                  (pred_7 ?v12) (pred_3 ?v1) (pred_4 ?v13 ?v12))
:effect (and (pred_3 ?v13) (pred_4 ?v1 ?v12)
        (not (pred_3 ?v1)) (not (pred_4 ?v13 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_9 ?v12) (pred_5 ?v5) 
                  (pred_7 ?v12) (pred_3 ?v5))
:effect (and (pred_1 ) (pred_4 ?v5 ?v12) (not (pred_3 ?v5)))))


	
