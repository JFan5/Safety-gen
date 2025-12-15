; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 824406596 --problem-name spanner-s2-n2-l3-s824406596
(define (problem spanner-s2-n2-l3-s824406596)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_04 obj_06 - type_4
     obj_03 obj_02 - type_2
     obj_09 obj_01 obj_07 - type_5
     obj_05 obj_08 - type_5
    )
 (:init 
    (pred_5 obj_10 obj_05)
    (pred_5 obj_04 obj_07)
    (pred_2 obj_04)
    (pred_5 obj_06 obj_09)
    (pred_2 obj_06)
    (pred_4 obj_03)
    (pred_5 obj_03 obj_08)
    (pred_4 obj_02)
    (pred_5 obj_02 obj_08)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_07 obj_08)
    (pred_3 obj_09 obj_01)
    (pred_3 obj_01 obj_07)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
