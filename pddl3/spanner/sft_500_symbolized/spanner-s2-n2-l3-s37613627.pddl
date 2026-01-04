; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 37613627 --problem-name spanner-s2-n2-l3-s37613627
(define (problem spanner-s2-n2-l3-s37613627)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_06 obj_05 - type_5
     obj_03 obj_04 - type_1
     obj_09 obj_01 obj_07 - type_3
     obj_02 obj_10 - type_3
    )
 (:init 
    (pred_5 obj_08 obj_02)
    (pred_5 obj_06 obj_07)
    (pred_3 obj_06)
    (pred_5 obj_05 obj_01)
    (pred_3 obj_05)
    (pred_1 obj_03)
    (pred_5 obj_03 obj_10)
    (pred_1 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_07 obj_10)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_01 obj_07)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
