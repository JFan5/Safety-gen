(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_01 obj_03 - type_1
obj_08 obj_02 obj_04 - type_2
obj_05 obj_09 obj_06 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_03)
(pred_3 obj_05 obj_02)
(pred_3 obj_09 obj_08)
(pred_3 obj_06 obj_04)
)
(:goal
(and
(pred_3 obj_05 obj_02)
(pred_3 obj_09 obj_08)
(pred_3 obj_06 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_03))))
)
)