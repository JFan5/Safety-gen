(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v9)
             (pred_2 ?v5 ?v13)
             (pred_5 ?v12 ?v13)
             (pred_4 ?v8 ?v12 )
	     (pred_6 ?v12)
             (pred_3 ?v11)
             (pred_9 ?v5)
             (pred_10 ?v13)
             (pred_11 ?v12)
             (pred_8 ?v5)
             (pred_1 ?v12)
             (pred_7 ))



(:action op_3
:parameters (?v3 ?v10 ?v7 ?v1)
:precondition (and (pred_3 ?v3) (pred_3 ?v10) (pred_9 ?v7) (pred_10 ?v1)
          (pred_12 ?v3 ?v10) (pred_2 ?v7 ?v1)
                   (pred_5 ?v10 ?v1) (pred_6 ?v3) 
                   (pred_11 ?v10) (pred_8 ?v7))
:effect (and  (pred_1 ?v10) (not (pred_11 ?v10))))


(:action op_2
:parameters (?v3 ?v4)
:precondition (and (pred_3 ?v3) (pred_3 ?v4)
               (pred_6 ?v3) (pred_12 ?v3 ?v4) (pred_1 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v3))))

(:action op_5
:parameters (?v3 ?v7)
:precondition (and (pred_3 ?v3) (pred_9 ?v7) 
                  (pred_6 ?v3) (pred_4 ?v7 ?v3) (pred_7 ))
:effect (and (pred_8 ?v7)
   (not (pred_4 ?v7 ?v3)) (not (pred_7 ))))


(:action op_1
:parameters (?v3 ?v6 ?v2)
:precondition (and (pred_3 ?v3) (pred_9 ?v6) (pred_9 ?v2)
                  (pred_6 ?v3) (pred_8 ?v2) (pred_4 ?v6 ?v3))
:effect (and (pred_8 ?v6) (pred_4 ?v2 ?v3)
        (not (pred_8 ?v2)) (not (pred_4 ?v6 ?v3))))

(:action op_4
:parameters (?v3 ?v7)
:precondition (and (pred_3 ?v3) (pred_9 ?v7) 
                  (pred_6 ?v3) (pred_8 ?v7))
:effect (and (pred_7 ) (pred_4 ?v7 ?v3) (not (pred_8 ?v7)))))


	
