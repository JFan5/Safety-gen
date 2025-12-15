(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v5)
             (pred_4 ?v11 ?v1)
             (pred_11 ?v8 ?v1)
             (pred_12 ?v10 ?v8 )
	     (pred_6 ?v8)
             (pred_9 ?v9)
             (pred_5 ?v11)
             (pred_2 ?v1)
             (pred_1 ?v8)
             (pred_10 ?v11)
             (pred_3 ?v8)
             (pred_8 ))



(:action op_2
:parameters (?v7 ?v12 ?v4 ?v3)
:precondition (and (pred_9 ?v7) (pred_9 ?v12) (pred_5 ?v4) (pred_2 ?v3)
          (pred_7 ?v7 ?v12) (pred_4 ?v4 ?v3)
                   (pred_11 ?v12 ?v3) (pred_6 ?v7) 
                   (pred_1 ?v12) (pred_10 ?v4))
:effect (and  (pred_3 ?v12) (not (pred_1 ?v12))))


(:action op_5
:parameters (?v7 ?v2)
:precondition (and (pred_9 ?v7) (pred_9 ?v2)
               (pred_6 ?v7) (pred_7 ?v7 ?v2) (pred_3 ?v2))
:effect (and (pred_6 ?v2) (not (pred_6 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_9 ?v7) (pred_5 ?v4) 
                  (pred_6 ?v7) (pred_12 ?v4 ?v7) (pred_8 ))
:effect (and (pred_10 ?v4)
   (not (pred_12 ?v4 ?v7)) (not (pred_8 ))))


(:action op_3
:parameters (?v7 ?v13 ?v6)
:precondition (and (pred_9 ?v7) (pred_5 ?v13) (pred_5 ?v6)
                  (pred_6 ?v7) (pred_10 ?v6) (pred_12 ?v13 ?v7))
:effect (and (pred_10 ?v13) (pred_12 ?v6 ?v7)
        (not (pred_10 ?v6)) (not (pred_12 ?v13 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_9 ?v7) (pred_5 ?v4) 
                  (pred_6 ?v7) (pred_10 ?v4))
:effect (and (pred_8 ) (pred_12 ?v4 ?v7) (not (pred_10 ?v4)))))


	
