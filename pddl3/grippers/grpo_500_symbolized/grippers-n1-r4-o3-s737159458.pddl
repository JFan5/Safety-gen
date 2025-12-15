(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_08 obj_03 - type_3
obj_01 obj_04 obj_05 obj_10 - type_2
obj_09 obj_07 obj_02 - object)
(:init
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_08)
(pred_4 obj_06 obj_03)
(pred_2 obj_09 obj_05)
(pred_2 obj_07 obj_04)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_03))))
)
)