(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_02 obj_04 - type_2
obj_08 obj_09 obj_06 obj_10 - type_1
obj_03 obj_07 obj_05 - object)
(:init
(pred_1 obj_01 obj_06)
(pred_2 obj_01 obj_02)
(pred_2 obj_01 obj_04)
(pred_3 obj_03 obj_10)
(pred_3 obj_07 obj_09)
(pred_3 obj_05 obj_06)
)
(:goal
(and
(pred_3 obj_03 obj_10)
(pred_3 obj_07 obj_09)
(pred_3 obj_05 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_04))))
)
)