(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_02 obj_03 - type_1
obj_06 obj_08 obj_04 - type_2
obj_01 obj_07 obj_05 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_3 obj_09 obj_02)
(pred_3 obj_09 obj_03)
(pred_2 obj_01 obj_06)
(pred_2 obj_07 obj_06)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_07 obj_06)
(pred_2 obj_05 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_03))))
)
)