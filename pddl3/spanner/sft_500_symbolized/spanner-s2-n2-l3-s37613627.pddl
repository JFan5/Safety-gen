; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 37613627 --problem-name spanner-s2-n2-l3-s37613627
(define (problem spanner-s2-n2-l3-s37613627)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_02 obj_09 - type_3
     obj_10 obj_04 - type_1
     obj_03 obj_01 obj_08 - type_4
     obj_06 obj_07 - type_4
    )
 (:init 
    (pred_6 obj_05 obj_06)
    (pred_6 obj_02 obj_08)
    (pred_3 obj_02)
    (pred_6 obj_09 obj_01)
    (pred_3 obj_09)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_07)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_07)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_08 obj_07)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_01 obj_08)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
