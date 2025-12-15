(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_1
obj_07 obj_01 obj_09 obj_12 - type_3
obj_08 obj_04 obj_10 - type_2
obj_11 obj_02 obj_03 - object)
(:init
(pred_3 obj_05 obj_08)
(pred_1 obj_05 obj_07)
(pred_1 obj_05 obj_01)
(pred_3 obj_06 obj_04)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_12)
(pred_2 obj_11 obj_08)
(pred_2 obj_02 obj_04)
(pred_2 obj_03 obj_08)
)
(:goal
(and
(pred_2 obj_11 obj_10)
(pred_2 obj_02 obj_10)
(pred_2 obj_03 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_10) (pred_3 obj_06 obj_10))))
  )
)
)