; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 30122554 --problem-name spanner-s2-n2-l3-s30122554
(define (problem spanner-s2-n2-l3-s30122554)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_04 obj_01 - type_5
     obj_07 obj_03 - type_3
     obj_09 obj_06 obj_05 - type_2
     obj_02 obj_08 - type_2
    )
 (:init 
    (pred_1 obj_10 obj_02)
    (pred_1 obj_04 obj_09)
    (pred_5 obj_04)
    (pred_1 obj_01 obj_06)
    (pred_5 obj_01)
    (pred_4 obj_07)
    (pred_1 obj_07 obj_08)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_06 obj_05)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
