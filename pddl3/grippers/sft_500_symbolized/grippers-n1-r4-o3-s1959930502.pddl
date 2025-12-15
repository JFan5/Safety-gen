(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_2
obj_03 obj_10 - type_1
obj_06 obj_07 obj_02 obj_09 - type_3
obj_01 obj_05 obj_08 - object)
(:init
(pred_1 obj_04 obj_07)
(pred_3 obj_04 obj_03)
(pred_3 obj_04 obj_10)
(pred_4 obj_01 obj_06)
(pred_4 obj_05 obj_09)
(pred_4 obj_08 obj_02)
)
(:goal
(and
(pred_4 obj_01 obj_06)
(pred_4 obj_05 obj_07)
(pred_4 obj_08 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_04 ?b obj_03))))
)
)