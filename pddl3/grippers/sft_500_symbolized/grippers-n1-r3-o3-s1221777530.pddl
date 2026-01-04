(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_08 obj_03 - type_1
obj_01 obj_04 obj_06 - type_3
obj_05 obj_07 obj_09 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_03)
(pred_2 obj_05 obj_01)
(pred_2 obj_07 obj_04)
(pred_2 obj_09 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_09 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_02 ?b obj_03))))
)
)