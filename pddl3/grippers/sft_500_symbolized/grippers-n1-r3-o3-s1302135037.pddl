(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_03 obj_01 - type_3
obj_04 obj_02 obj_06 - type_2
obj_08 obj_05 obj_07 - object)
(:init
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_03)
(pred_4 obj_09 obj_01)
(pred_1 obj_08 obj_02)
(pred_1 obj_05 obj_02)
(pred_1 obj_07 obj_04)
)
(:goal
(and
(pred_1 obj_08 obj_06)
(pred_1 obj_05 obj_06)
(pred_1 obj_07 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_09 ?b obj_03))))
)
)