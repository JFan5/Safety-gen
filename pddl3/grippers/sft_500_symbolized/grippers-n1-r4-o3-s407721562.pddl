(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_03 obj_08 - type_3
obj_05 obj_10 obj_02 obj_01 - type_2
obj_06 obj_07 obj_09 - object)
(:init
(pred_4 obj_04 obj_01)
(pred_1 obj_04 obj_03)
(pred_1 obj_04 obj_08)
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_01)
(pred_2 obj_09 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_05)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_04 ?b obj_03))))
)
)