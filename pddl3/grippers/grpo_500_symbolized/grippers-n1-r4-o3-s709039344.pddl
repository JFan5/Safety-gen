(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_09 obj_04 - type_3
obj_10 obj_06 obj_08 obj_02 - type_2
obj_07 obj_01 obj_03 - object)
(:init
(pred_4 obj_05 obj_08)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_04)
(pred_3 obj_07 obj_10)
(pred_3 obj_01 obj_10)
(pred_3 obj_03 obj_06)
)
(:goal
(and
(pred_3 obj_07 obj_10)
(pred_3 obj_01 obj_10)
(pred_3 obj_03 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_04))))
)
)