; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 30122554 --problem-name spanner-s2-n2-l3-s30122554
(define (problem spanner-s2-n2-l3-s30122554)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_06 obj_09 - type_1
     obj_08 obj_10 - type_3
     obj_02 obj_03 obj_07 - type_2
     obj_04 obj_05 - type_2
    )
 (:init 
    (pred_3 obj_01 obj_04)
    (pred_3 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_3 obj_09 obj_03)
    (pred_1 obj_09)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_05)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_07 obj_05)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_03 obj_07)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
