(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_04 obj_10 - type_3
obj_03 obj_06 obj_02 obj_05 - type_2
obj_07 obj_01 obj_08 - object)
(:init
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_10)
(pred_2 obj_07 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_01 obj_05)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_04))))
)
)