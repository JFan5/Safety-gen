(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_06 obj_03 - type_3
obj_04 obj_02 obj_10 obj_07 - type_2
obj_01 obj_08 obj_09 - object)
(:init
(pred_4 obj_05 obj_07)
(pred_2 obj_05 obj_06)
(pred_2 obj_05 obj_03)
(pred_3 obj_01 obj_04)
(pred_3 obj_08 obj_02)
(pred_3 obj_09 obj_07)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_08 obj_10)
(pred_3 obj_09 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_03))))
)
)