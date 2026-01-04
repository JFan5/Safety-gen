; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 953332984 --problem-name spanner-s2-n2-l3-s953332984
(define (problem spanner-s2-n2-l3-s953332984)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_01 obj_10 - type_2
     obj_09 obj_08 - type_1
     obj_06 obj_02 obj_05 - type_4
     obj_04 obj_03 - type_4
    )
 (:init 
    (pred_5 obj_07 obj_04)
    (pred_5 obj_01 obj_02)
    (pred_1 obj_01)
    (pred_5 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_6 obj_09)
    (pred_5 obj_09 obj_03)
    (pred_6 obj_08)
    (pred_5 obj_08 obj_03)
    (pred_3 obj_04 obj_06)
    (pred_3 obj_05 obj_03)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_05)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_09)) (not (pred_4 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
