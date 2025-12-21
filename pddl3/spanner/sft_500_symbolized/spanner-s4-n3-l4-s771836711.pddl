; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 771836711 --problem-name spanner-s4-n3-l4-s771836711
(define (problem spanner-s4-n3-l4-s771836711)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_14 obj_01 obj_10 obj_07 - type_5
     obj_03 obj_04 obj_06 - type_4
     obj_09 obj_13 obj_11 obj_05 - type_2
     obj_12 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_12)
    (pred_2 obj_14 obj_11)
    (pred_1 obj_14)
    (pred_2 obj_01 obj_09)
    (pred_1 obj_01)
    (pred_2 obj_10 obj_13)
    (pred_1 obj_10)
    (pred_2 obj_07 obj_13)
    (pred_1 obj_07)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_08)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_08)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_05 obj_08)
    (pred_6 obj_09 obj_13)
    (pred_6 obj_13 obj_11)
    (pred_6 obj_11 obj_05)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_04)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
