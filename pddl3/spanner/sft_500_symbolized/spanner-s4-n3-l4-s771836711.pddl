; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 771836711 --problem-name spanner-s4-n3-l4-s771836711
(define (problem spanner-s4-n3-l4-s771836711)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_03 obj_01 obj_13 obj_06 - type_2
     obj_05 obj_14 obj_09 - type_5
     obj_02 obj_04 obj_11 obj_12 - type_4
     obj_10 obj_07 - type_4
    )
 (:init 
    (pred_5 obj_08 obj_10)
    (pred_5 obj_03 obj_11)
    (pred_4 obj_03)
    (pred_5 obj_01 obj_02)
    (pred_4 obj_01)
    (pred_5 obj_13 obj_04)
    (pred_4 obj_13)
    (pred_5 obj_06 obj_04)
    (pred_4 obj_06)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_07)
    (pred_1 obj_14)
    (pred_5 obj_14 obj_07)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_07)
    (pred_2 obj_10 obj_02)
    (pred_2 obj_12 obj_07)
    (pred_2 obj_02 obj_04)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_11 obj_12)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_14)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_14)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
