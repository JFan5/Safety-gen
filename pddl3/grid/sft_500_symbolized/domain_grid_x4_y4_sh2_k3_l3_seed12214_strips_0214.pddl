(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v8)
             (pred_3 ?v12 ?v11)
             (pred_11 ?v1 ?v11)
             (pred_4 ?v5 ?v1 )
	     (pred_7 ?v1)
             (pred_12 ?v2)
             (pred_10 ?v12)
             (pred_6 ?v11)
             (pred_5 ?v1)
             (pred_1 ?v12)
             (pred_9 ?v1)
             (pred_2 ))



(:action op_2
:parameters (?v3 ?v7 ?v4 ?v13)
:precondition (and (pred_12 ?v3) (pred_12 ?v7) (pred_10 ?v4) (pred_6 ?v13)
          (pred_8 ?v3 ?v7) (pred_3 ?v4 ?v13)
                   (pred_11 ?v7 ?v13) (pred_7 ?v3) 
                   (pred_5 ?v7) (pred_1 ?v4))
:effect (and  (pred_9 ?v7) (not (pred_5 ?v7))))


(:action op_5
:parameters (?v3 ?v9)
:precondition (and (pred_12 ?v3) (pred_12 ?v9)
               (pred_7 ?v3) (pred_8 ?v3 ?v9) (pred_9 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v3))))

(:action op_4
:parameters (?v3 ?v4)
:precondition (and (pred_12 ?v3) (pred_10 ?v4) 
                  (pred_7 ?v3) (pred_4 ?v4 ?v3) (pred_2 ))
:effect (and (pred_1 ?v4)
   (not (pred_4 ?v4 ?v3)) (not (pred_2 ))))


(:action op_3
:parameters (?v3 ?v6 ?v10)
:precondition (and (pred_12 ?v3) (pred_10 ?v6) (pred_10 ?v10)
                  (pred_7 ?v3) (pred_1 ?v10) (pred_4 ?v6 ?v3))
:effect (and (pred_1 ?v6) (pred_4 ?v10 ?v3)
        (not (pred_1 ?v10)) (not (pred_4 ?v6 ?v3))))

(:action op_1
:parameters (?v3 ?v4)
:precondition (and (pred_12 ?v3) (pred_10 ?v4) 
                  (pred_7 ?v3) (pred_1 ?v4))
:effect (and (pred_2 ) (pred_4 ?v4 ?v3) (not (pred_1 ?v4)))))


	
