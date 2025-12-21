(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v8)
             (pred_5 ?v9 ?v12)
             (pred_11 ?v6 ?v12)
             (pred_3 ?v5 ?v6 )
	     (pred_12 ?v6)
             (pred_10 ?v4)
             (pred_7 ?v9)
             (pred_1 ?v12)
             (pred_6 ?v6)
             (pred_9 ?v9)
             (pred_8 ?v6)
             (pred_4 ))



(:action op_2
:parameters (?v7 ?v10 ?v11 ?v1)
:precondition (and (pred_10 ?v7) (pred_10 ?v10) (pred_7 ?v11) (pred_1 ?v1)
          (pred_2 ?v7 ?v10) (pred_5 ?v11 ?v1)
                   (pred_11 ?v10 ?v1) (pred_12 ?v7) 
                   (pred_6 ?v10) (pred_9 ?v11))
:effect (and  (pred_8 ?v10) (not (pred_6 ?v10))))


(:action op_1
:parameters (?v7 ?v3)
:precondition (and (pred_10 ?v7) (pred_10 ?v3)
               (pred_12 ?v7) (pred_2 ?v7 ?v3) (pred_8 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v7))))

(:action op_3
:parameters (?v7 ?v11)
:precondition (and (pred_10 ?v7) (pred_7 ?v11) 
                  (pred_12 ?v7) (pred_3 ?v11 ?v7) (pred_4 ))
:effect (and (pred_9 ?v11)
   (not (pred_3 ?v11 ?v7)) (not (pred_4 ))))


(:action op_5
:parameters (?v7 ?v13 ?v2)
:precondition (and (pred_10 ?v7) (pred_7 ?v13) (pred_7 ?v2)
                  (pred_12 ?v7) (pred_9 ?v2) (pred_3 ?v13 ?v7))
:effect (and (pred_9 ?v13) (pred_3 ?v2 ?v7)
        (not (pred_9 ?v2)) (not (pred_3 ?v13 ?v7))))

(:action op_4
:parameters (?v7 ?v11)
:precondition (and (pred_10 ?v7) (pred_7 ?v11) 
                  (pred_12 ?v7) (pred_9 ?v11))
:effect (and (pred_4 ) (pred_3 ?v11 ?v7) (not (pred_9 ?v11)))))


	
