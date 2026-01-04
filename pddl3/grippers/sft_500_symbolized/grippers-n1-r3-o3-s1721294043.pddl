(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_2
obj_09 obj_04 - type_1
obj_06 obj_07 obj_03 - type_3
obj_01 obj_08 obj_02 - object)
(:init
(pred_1 obj_05 obj_06)
(pred_4 obj_05 obj_09)
(pred_4 obj_05 obj_04)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_06)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_05 ?b obj_04))))
)
)