(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v9)
             (pred_11 ?v13 ?v11)
             (pred_8 ?v6 ?v11)
             (pred_7 ?v12 ?v6 )
	     (pred_1 ?v6)
             (pred_3 ?v1)
             (pred_5 ?v13)
             (pred_10 ?v11)
             (pred_2 ?v6)
             (pred_4 ?v13)
             (pred_6 ?v6)
             (pred_12 ))



(:action op_5
:parameters (?v3 ?v10 ?v2 ?v5)
:precondition (and (pred_3 ?v3) (pred_3 ?v10) (pred_5 ?v2) (pred_10 ?v5)
          (pred_9 ?v3 ?v10) (pred_11 ?v2 ?v5)
                   (pred_8 ?v10 ?v5) (pred_1 ?v3) 
                   (pred_2 ?v10) (pred_4 ?v2))
:effect (and  (pred_6 ?v10) (not (pred_2 ?v10))))


(:action op_4
:parameters (?v3 ?v7)
:precondition (and (pred_3 ?v3) (pred_3 ?v7)
               (pred_1 ?v3) (pred_9 ?v3 ?v7) (pred_6 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v3))))

(:action op_2
:parameters (?v3 ?v2)
:precondition (and (pred_3 ?v3) (pred_5 ?v2) 
                  (pred_1 ?v3) (pred_7 ?v2 ?v3) (pred_12 ))
:effect (and (pred_4 ?v2)
   (not (pred_7 ?v2 ?v3)) (not (pred_12 ))))


(:action op_3
:parameters (?v3 ?v8 ?v4)
:precondition (and (pred_3 ?v3) (pred_5 ?v8) (pred_5 ?v4)
                  (pred_1 ?v3) (pred_4 ?v4) (pred_7 ?v8 ?v3))
:effect (and (pred_4 ?v8) (pred_7 ?v4 ?v3)
        (not (pred_4 ?v4)) (not (pred_7 ?v8 ?v3))))

(:action op_1
:parameters (?v3 ?v2)
:precondition (and (pred_3 ?v3) (pred_5 ?v2) 
                  (pred_1 ?v3) (pred_4 ?v2))
:effect (and (pred_12 ) (pred_7 ?v2 ?v3) (not (pred_4 ?v2)))))


	
