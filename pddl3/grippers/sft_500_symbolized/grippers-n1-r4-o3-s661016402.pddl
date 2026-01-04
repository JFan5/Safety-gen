(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_06 obj_03 - type_3
obj_04 obj_10 obj_09 obj_02 - type_2
obj_05 obj_07 obj_08 - object)
(:init
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_06)
(pred_3 obj_01 obj_03)
(pred_4 obj_05 obj_04)
(pred_4 obj_07 obj_04)
(pred_4 obj_08 obj_04)
)
(:goal
(and
(pred_4 obj_05 obj_02)
(pred_4 obj_07 obj_10)
(pred_4 obj_08 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_03))))
)
)