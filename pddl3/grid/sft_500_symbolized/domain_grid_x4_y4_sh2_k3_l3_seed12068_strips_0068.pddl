(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v1 ?v8)
             (pred_1 ?v13 ?v9)
             (pred_12 ?v1 ?v9)
             (pred_8 ?v5 ?v1 )
	     (pred_5 ?v1)
             (pred_3 ?v6)
             (pred_6 ?v13)
             (pred_10 ?v9)
             (pred_11 ?v1)
             (pred_4 ?v13)
             (pred_9 ?v1)
             (pred_2 ))



(:action op_1
:parameters (?v10 ?v7 ?v2 ?v12)
:precondition (and (pred_3 ?v10) (pred_3 ?v7) (pred_6 ?v2) (pred_10 ?v12)
          (pred_7 ?v10 ?v7) (pred_1 ?v2 ?v12)
                   (pred_12 ?v7 ?v12) (pred_5 ?v10) 
                   (pred_11 ?v7) (pred_4 ?v2))
:effect (and  (pred_9 ?v7) (not (pred_11 ?v7))))


(:action op_2
:parameters (?v10 ?v11)
:precondition (and (pred_3 ?v10) (pred_3 ?v11)
               (pred_5 ?v10) (pred_7 ?v10 ?v11) (pred_9 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v10))))

(:action op_5
:parameters (?v10 ?v2)
:precondition (and (pred_3 ?v10) (pred_6 ?v2) 
                  (pred_5 ?v10) (pred_8 ?v2 ?v10) (pred_2 ))
:effect (and (pred_4 ?v2)
   (not (pred_8 ?v2 ?v10)) (not (pred_2 ))))


(:action op_3
:parameters (?v10 ?v3 ?v4)
:precondition (and (pred_3 ?v10) (pred_6 ?v3) (pred_6 ?v4)
                  (pred_5 ?v10) (pred_4 ?v4) (pred_8 ?v3 ?v10))
:effect (and (pred_4 ?v3) (pred_8 ?v4 ?v10)
        (not (pred_4 ?v4)) (not (pred_8 ?v3 ?v10))))

(:action op_4
:parameters (?v10 ?v2)
:precondition (and (pred_3 ?v10) (pred_6 ?v2) 
                  (pred_5 ?v10) (pred_4 ?v2))
:effect (and (pred_2 ) (pred_8 ?v2 ?v10) (not (pred_4 ?v2)))))


	
