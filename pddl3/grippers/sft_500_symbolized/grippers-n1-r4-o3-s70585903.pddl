(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_05 obj_03 - type_3
obj_07 obj_02 obj_10 obj_04 - type_1
obj_09 obj_01 obj_08 - object)
(:init
(pred_2 obj_06 obj_10)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_03)
(pred_3 obj_09 obj_02)
(pred_3 obj_01 obj_10)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_07)
(pred_3 obj_08 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_06 ?b obj_03))))
)
)