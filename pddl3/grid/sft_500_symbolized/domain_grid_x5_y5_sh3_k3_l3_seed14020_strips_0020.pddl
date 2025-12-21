(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v10)
             (pred_3 ?v9 ?v12)
             (pred_2 ?v6 ?v12)
             (pred_11 ?v5 ?v6 )
	     (pred_6 ?v6)
             (pred_1 ?v3)
             (pred_4 ?v9)
             (pred_9 ?v12)
             (pred_5 ?v6)
             (pred_12 ?v9)
             (pred_8 ?v6)
             (pred_7 ))



(:action op_5
:parameters (?v7 ?v13 ?v2 ?v4)
:precondition (and (pred_1 ?v7) (pred_1 ?v13) (pred_4 ?v2) (pred_9 ?v4)
          (pred_10 ?v7 ?v13) (pred_3 ?v2 ?v4)
                   (pred_2 ?v13 ?v4) (pred_6 ?v7) 
                   (pred_5 ?v13) (pred_12 ?v2))
:effect (and  (pred_8 ?v13) (not (pred_5 ?v13))))


(:action op_4
:parameters (?v7 ?v11)
:precondition (and (pred_1 ?v7) (pred_1 ?v11)
               (pred_6 ?v7) (pred_10 ?v7 ?v11) (pred_8 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v7))))

(:action op_3
:parameters (?v7 ?v2)
:precondition (and (pred_1 ?v7) (pred_4 ?v2) 
                  (pred_6 ?v7) (pred_11 ?v2 ?v7) (pred_7 ))
:effect (and (pred_12 ?v2)
   (not (pred_11 ?v2 ?v7)) (not (pred_7 ))))


(:action op_1
:parameters (?v7 ?v1 ?v8)
:precondition (and (pred_1 ?v7) (pred_4 ?v1) (pred_4 ?v8)
                  (pred_6 ?v7) (pred_12 ?v8) (pred_11 ?v1 ?v7))
:effect (and (pred_12 ?v1) (pred_11 ?v8 ?v7)
        (not (pred_12 ?v8)) (not (pred_11 ?v1 ?v7))))

(:action op_2
:parameters (?v7 ?v2)
:precondition (and (pred_1 ?v7) (pred_4 ?v2) 
                  (pred_6 ?v7) (pred_12 ?v2))
:effect (and (pred_7 ) (pred_11 ?v2 ?v7) (not (pred_12 ?v2)))))


	
