; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 824406596 --problem-name spanner-s2-n2-l3-s824406596
(define (problem spanner-s2-n2-l3-s824406596)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_07 obj_05 - type_5
     obj_06 obj_08 - type_1
     obj_04 obj_02 obj_01 - type_3
     obj_03 obj_10 - type_3
    )
 (:init 
    (pred_6 obj_09 obj_03)
    (pred_6 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_6 obj_05 obj_04)
    (pred_1 obj_05)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_10)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_10)
    (pred_5 obj_03 obj_04)
    (pred_5 obj_01 obj_10)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_02 obj_01)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
